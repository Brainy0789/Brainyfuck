package;

import sys.io.File;
import hxBrainfuck.Brainfuck;
import hxBrainfuck.BFHelpers;

//command line stuff

class Brainyfuck
{
    static var bf:Brainfuck;
    static function main()
    {
        var args = Sys.args();
        
        bf = new Brainfuck();

        if (args.length == 0)
        {
            while (true)
            {
                var code = BFHelpers.input('>>> ');
                var codeArray = BFHelpers.arrayizeString(code);

                var useInput = (codeArray.indexOf(',') != -1);

                var input = '';

                if (useInput)
                    var input = BFHelpers.input('Input: ');

                try
                {
                    bf.interp(code, input, false, true);
                } catch(e:Dynamic) {
                    Sys.println('Error occurred: ' + e);
                }
            }
        }

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