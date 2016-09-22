/* DS2 Package - Twitter */
proc ds2;
   package OAuth2 / overwrite=yes;
      
      dcl package http h;

      dcl nvarchar(1024) APIAuthorizationURL;
      dcl varchar (1024) APIKey;
      dcl varchar (1024) APISecret;
      dcl nvarchar(1024) accessToken;

      dcl nvarchar(1024) requestContentType;

      method OAuth2(nvarchar(1024) APIAuthorizationURL, varchar(1024) APIKey, varchar(1024) APISecret);
         put 'Loading OAuth2 DS2 package.';
         
         this.APIKey = APIKey;
         this.APISecret = APISecret;
         this.APIAuthorizationURL = APIAuthorizationURL;
         this.requestContentType = 'application/x-www-form-urlencoded; charset=UTF-8';
         
         this.h = _new_ http();

         put 'OAuth2 DS2 package loaded.';
      end;

      method getEncodedKeyAndSecret() returns nvarchar(1024);
         dcl nvarchar(1024) encodedAuthorization;
         encodedAuthorization = 'Basic ' || trim(put(cat(this.APIKey,':',this.APISecret),$base64x1024.));
         return encodedAuthorization;
      end;

      method requestsAccess();
         dcl package json j();

         dcl int httpStatusCode httpRC jsonRC jsonTokenType jsonParseFlags;

         dcl nvarchar(1024) jsonToken;

         dcl nvarchar( 1024) responseContentType;
         dcl nvarchar(16384) responseHeaders;
         dcl nvarchar(65536) responseBody;

         h.createPostMethod(this.APIAuthorizationURL);
         h.addRequestHeader('Authorization',getEncodedKeyAndSecret());
         h.setRequestContentType(this.requestContentType);
         h.setRequestBodyAsString('grant_type=client_credentials&');
         h.executeMethod();

         httpStatusCode = h.getStatusCode();
         if httpStatusCode = 200 then do;
            h.getResponseContentType(responseContentType, httpRC);
            h.getResponseHeadersAsString(responseHeaders, httpRC);
            h.getResponseBodyAsString(responseBody, httpRC);
            
            jsonRC = j.createParser(responseBody);
            if jsonRC = 0 then do;
               j.getNextToken(jsonRC,jsonToken,jsonTokenType,jsonParseFlags);
               do while (jsonRC = 0);
                  if j.isString(jsonTokenType) then do;
                     if jsonToken = 'access_token' then do;
                        j.getNextToken(jsonRC,jsonToken,jsonTokenType,jsonParseFlags);
                        this.accessToken = jsonToken;
                        leave;
                     end;
                  end;
                  j.getNextToken(jsonRC,jsonToken,jsonTokenType,jsonParseFlags);
               end;
            end;
            else do;
               put 'ERROR: JSON status create parser return code ' jsonRC;
               put 'ERROR- Exception not handled!';
            end;
            j.destroyParser();
         end;
         else do;
            put 'ERROR: HTTP execute method return code ' httpStatusCode;
            put 'ERROR- Exception not handled!';
         end;
      end;

      method GET(nvarchar(1024) requestURL) returns nvarchar(1048576);
         dcl int httpStatusCode httpRC ;

         dcl nvarchar(1024) responseContentType;
         dcl nvarchar(16384) responseHeaders;
         dcl nvarchar(1048576) responseBody;

         h.createGetMethod(requestURL);
         h.addRequestHeader('Authorization','Bearer ' || this.accessToken);
         h.executeMethod();

         httpStatusCode = h.getStatusCode();
         if httpStatusCode = 200 then do;
            h.getResponseContentType(responseContentType, httpRC);
            h.getResponseHeadersAsString(responseHeaders, httpRC);
            h.getResponseBodyAsString(responseBody, httpRC);           
         end;
         else do;
            put 'ERROR: HTTP execute method return code ' httpStatusCode;
            put 'ERROR- Exception not handled!';
         end;
         return responseBody;
      end;

      method delete();
         put 'Destroying OAuth2 DS2 package.';
         h.delete();
         put 'OAuth2 DS2 package destroyed.';
      end;
   endpackage;
   run;

   data twitter_out(overwrite=yes);
      dcl nvarchar(20)  id_str;
      dcl nvarchar(150) text;

      dcl package OAuth2 twitter;

      method init();
         dcl varchar(1024) APIKey;
         dcl varchar(1024) APISecret;
         APIKey    = 'BmUd3ErEj4P5AYeAaG05ukaGe';
         APISecret = '0ktupZ3V0mH87UOZ1wnIaXnDS9DhEhRXdSsfiEoaToC7S1XT3b';
         twitter = _new_ OAuth2(
            'https://api.twitter.com/oauth2/token',
            APIKey,
            APISecret);
         twitter.requestsAccess();
      end;

      method run();
         dcl package json j();
         dcl int jsonRC jsonTokenType jsonParseFlags;
         dcl nvarchar(1024) jsonToken; 
         dcl nvarchar(1048576) response; 
         
         response = twitter.GET('https://api.twitter.com/1.1/statuses/user_timeline.json?count=200&screen_name=wyborcza_biz');

         jsonRC = j.createParser(response);
         if jsonRC = 0 then do;
            j.getNextToken(jsonRC,jsonToken,jsonTokenType,jsonParseFlags);
            do while (jsonRC = 0);
               if j.isString(jsonTokenType) then do;
                  if jsonToken = 'id_str' then do;
                     j.getNextToken(jsonRC,jsonToken,jsonTokenType,jsonParseFlags);
                     id_str = jsonToken;
                  end;
                  else if jsonToken = 'text' then do;
                     j.getNextToken(jsonRC,jsonToken,jsonTokenType,jsonParseFlags);
                     text = jsonToken;
                     output;
                  end;
               end;
               j.getNextToken(jsonRC,jsonToken,jsonTokenType,jsonParseFlags);
            end;
         end;
         else do;
            put 'ERROR: JSON status create parser return code ' jsonRC;
            put 'ERROR- Exception not handled!';
         end;
         j.destroyParser();
      end;

      method term();
         twitter.delete();
      end;
   enddata;
   run;
quit;