-- =============================================================
-- Case ID: TC_PROCEDURE_SPECIFICATION_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: procedure_specification ::= procedure designator [ ( formal_parameter_list ) ]
-- Case Type: Positive
-- Test Focus: procedure specification with a file-class formal parameter in formal_parameter_list exercising the file interface class declaration in a procedure signature
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
use std.textio.all;
package ps_filetype_pkg is
  procedure p_write_line(file f: text; constant msg: in string);
end package;
package body ps_filetype_pkg is
  procedure p_write_line(file f: text; constant msg: in string) is
    variable l: line;
  begin
    write(l, msg);
    writeline(f, l);
  end procedure;
end package body;
