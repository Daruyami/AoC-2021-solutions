with Ada.Strings;           use Ada.Strings;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO;           use Ada.Text_IO;

procedure d2p2 is
    F : File_Type;
    File_Name : constant String := "d2p1input.txt";
    us : Unbounded_String;
    str : String := "forward 12";
    depth, x, aim, a : Integer := 0;

begin
    Open (F, In_File, File_Name);
    while not End_Of_File (F) loop
        us := To_Unbounded_String(Get_Line(F));
        a := Integer'Value(Slice(us, Index(us," ")+1, Length(us)));
        Put_Line(To_String(us));

        if Slice(us, 1, Index(us, " ")-1) = "forward" then
            x := x + a;
            depth := depth + (a*aim);
        elsif Slice(us, 1, Index(us, " ")-1) = "down" then
            aim := aim + a;
        elsif Slice(us, 1, Index(us, " ")-1) = "up" then
            aim := aim - a;
        else
            Put_Line("Error at loop, the slice is: " & Slice(us, 1, Index(us, " ")-1));
        end if;

        Put_Line("x: " & Integer'Image(x) & "  aim: " & Integer'Image(aim) & "  depth: " & Integer'Image(depth));
    end loop;
    Close(F);
    Put_Line("The result is: " & Integer'Image(x*depth));
end d2p2;
