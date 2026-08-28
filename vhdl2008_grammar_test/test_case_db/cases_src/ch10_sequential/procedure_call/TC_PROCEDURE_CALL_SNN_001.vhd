-- =============================================================
-- Case ID: TC_PROCEDURE_CALL_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_CALL
-- Standard Reference: IEEE 1076-2008 Section 10.4
-- Production: procedure_call ::= procedure_name [ ( actual_parameter_part ) ]
-- Case Type: Negative
-- Test Focus: SNN: missing closing parenthesis — `proc_name(val, val2;` is missing the right parenthesis, verifying that actual_parameter_part of a procedure_call must be closed with a right parenthesis
-- Expected Result: Triggers syntax error: missing ')' in procedure call
-- Dependencies: None
-- =============================================================
entity proc_call_noclose_ent is
  port (a : in integer; b : out integer);
end entity proc_call_noclose_ent;

architecture err of proc_call_noclose_ent is
  procedure copy_val(x : in integer; signal y : out integer) is
  begin
    y <= x;
  end procedure;
begin
  process(a) is
  begin
    copy_val(a, b;  -- ERROR: missing closing parenthesis
  end process;
end architecture err;
