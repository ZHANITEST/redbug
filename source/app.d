module app;

import std.stdio;
import std.conv;
import requests;

int main(string[] args){
    if(args.length == 1){
        writeln("Exit.");
        return 0;
    }

    string result;
    try{
        auto res = getContent(args[1]);
        result = to!string(res);
    }
    catch(Exception e){
        throw new Exception(e.msg);
    }

    File f = File("redbug.html", "w");
    f.write(result);
    f.close();

    writeln(result);

    return 0;
}