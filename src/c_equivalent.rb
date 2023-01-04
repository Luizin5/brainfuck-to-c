module C
  class C_equivalent

    def op_dot
      'putchar(arr[ptr]);'
    end

    def op_comma
      "arr[ptr] = getch();"
    end

    def op_plus #+
      "arr[ptr]++;"
    end

    def op_minus #-
      "arr[ptr]--;"
    end

    def op_left  # <
      "ptr--;"
    end

    def op_right # >
      "ptr++;"
    end

    def op_obracket # [
      "while(arr[ptr] != 0){"
    end

    def op_cbracket # ]
      "}"
    end

  end

  class Writer
    def initialize
      @c_code = [
        "#include <stdio.h>",
        "int main(){",
        "int arr[250] = {0};",
        "int ptr = 0;",
        [],
        "}"
      ]
    end
    
    def append_to_code txt
      @c_code[4] << txt
    end

    def write
      p File.write("out.c",@c_code.join("\n"))
    end
  end
end 
