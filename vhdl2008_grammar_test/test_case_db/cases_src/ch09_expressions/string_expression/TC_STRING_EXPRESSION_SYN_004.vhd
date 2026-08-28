-- =============================================================
-- Case ID: TC_STRING_EXPRESSION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_STRING_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: string_expression ::= expression
-- Case Type: Positive
-- Test Focus: function returning string: f_status(n) returns a string, and calling the function serves as a string expression assigned to a signal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_str_func is
  port (
    code : in  integer;
    y    : out string(1 to 10)
  );
end entity ent_str_func;

architecture func_str of ent_str_func is
  function f_status(c : integer) return string is
  begin
    if c = 0 then return "OK        ";
    else return "ERROR     ";
    end if;
  end function;
begin
  y <= f_status(code);
end architecture func_str;
