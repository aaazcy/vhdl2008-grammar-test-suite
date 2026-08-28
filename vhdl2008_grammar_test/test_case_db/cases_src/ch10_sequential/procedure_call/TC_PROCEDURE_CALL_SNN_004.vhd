-- =============================================================
-- Case ID: TC_PROCEDURE_CALL_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_CALL
-- Standard Reference: IEEE 1076-2008 Section 10.4
-- Production: procedure_call ::= procedure_name [ ( actual_parameter_part ) ]
-- Case Type: Negative
-- Test Focus: SNN: wrong parameter delimiter — `proc(a; b);` uses a semicolon instead of a comma to separate actual parameters, verifying that actual parameters must be separated by commas
-- Expected Result: Triggers syntax error: expected ',' as parameter delimiter
-- Dependencies: None
-- =============================================================
entity proc_call_bad_delim_ent is
  port (x, y : in integer; z : out integer);
end entity proc_call_bad_delim_ent;

architecture err of proc_call_bad_delim_ent is
  procedure add_vals(p1, p2 : in integer; signal res : out integer) is
  begin
    res <= p1 + p2;
  end procedure;
begin
  process(x, y) is
  begin
    add_vals(x; y, z);  -- ERROR: semicolon instead of comma
  end process;
end architecture err;
