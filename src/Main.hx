package;

import sys.io.File;
import hxBrainfuck.Brainfuck;

//command line stuff

class Main
{
    static var bf:Brainfuck;
    static function main()
    {
        var args = Sys.args();
        
        bf = new Brainfuck();

        if (args.length > 2) 
        {
            Sys.println('Too many arguments!');
            return;
        }

        var input = '';

        if (args.length > 1)
        {
            input = args[0];
        }

        try
        {
            bf.interp(File.getContent(args[0]), input, false, true);
        } catch (e:Dynamic)
        {
            Sys.println('Error occurred: ' + e);
        }
    }
}