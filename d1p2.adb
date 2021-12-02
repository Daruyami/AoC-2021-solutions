with Ada.Text_IO;
use Ada.Text_IO;

procedure d1p2 is
    F           : File_Type;
    File_Name   : constant String := "d1p1input.txt";
    a, b, c, sum: Integer;
    cnt         : Integer := 0;
begin
    Open (F, In_File, File_Name);
    a := Integer'Value(Get_Line(F));
    b := Integer'Value(Get_Line(F));
    c := Integer'Value(Get_Line(F));
    sum := a + b + c;
    Close(F);

    Open (F, In_File, File_Name);
    a := Integer'Value(Get_Line(F));
    b := Integer'Value(Get_Line(F));
    while not End_Of_File (F) loop
        c := Integer'Value(Get_Line(F));
        Put_Line("a: " & Integer'Image(a) & "  b: " & Integer'Image(b) & "  c: " & Integer'Image(c) & " | sum: " & Integer'Image(a + b + c));
        if (a+b+c)>sum then
            cnt := cnt + 1;
        end if;
        sum := a + b + c;
        a := b;
        b := c;
    end loop;
    Close (F);
    Put_Line(Integer'Image(cnt));

end d1p2;
