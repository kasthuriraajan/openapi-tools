import  ballerina/http;

# + clientEp - Connector http endpoint
public client class Client {
    http:Client clientEp;
    # Client initialization.
    #
    # + clientConfig - Client configuration details
    # + serviceUrl - Connector server URL
    # + return -  Returns error at failure of client initialization
    public isolated function init(http:ClientConfiguration clientConfig =  {}, string serviceUrl = "localhost:9090/payloadV") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    #
    # + return - Ok
    remote isolated function operationId01() returns string|error {
        string  path = string `/`;
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    #
    # + return - Ok
    remote isolated function operationId02() returns string|error {
        string  path = string `/`;
        http:Request request = new;
        //TODO: Update the request as needed;
        string response = check self.clientEp-> post(path, request, targetType = string);
        return response;
    }
    #
    # + id - id value
    # + return - Ok
    remote isolated function operationId03(int id) returns string|error {
        string  path = string `/v1/${id}`;
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    #
    # + return - Ok
    remote isolated function operationId04(int 'version, string name) returns string|error {
        string  path = string `/v1/${'version}/v2/${name}`;
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    #
    # + return - Ok
    remote isolated function operationId05(int 'version, int 'limit) returns string|error {
        string  path = string `/v1/${'version}/v2/${'limit}`;
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    #
    # + return - Ok
    remote isolated function operationId06(int age, string name) returns string|error {
        string  path = string `/v1/${age}/v2/${name}`;
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
}