-- =============================================================
-- Case ID: TC_SUBPROGRAM_SPECIFICATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_specification ::= procedure_specification | function_specification
-- Case Type: Negative
-- Test Focus: subprogram_specification: function without return type — the function_specification branch requires 'return type_mark'; a function specification missing the return clause is syntactically invalid
-- Expected Result: Triggers syntax error: missing return type in function specification
-- Dependencies: None
-- =============================================================
entity subprog_spec_no_return_func is
  port (
    x : in  integer;
    y : out integer
  );
end entity;

architecture test of subprog_spec_no_return_func is
  -- ERROR: function_specification requires 'return type_mark'
  -- Wrong: function f_bad(x:integer);  -- missing 'return <type>'
  -- The BNF requires: function designator [(params)] return type_mark
  -- Also it's not a procedure (which would not have return)

  function f_ok(x : integer) return integer is
  begin
    return x;
  end function;
begin
  y <= f_ok(x);
end architecture test;
