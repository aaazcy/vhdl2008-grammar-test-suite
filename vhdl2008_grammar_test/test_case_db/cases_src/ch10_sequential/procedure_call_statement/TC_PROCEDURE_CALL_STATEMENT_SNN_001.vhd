-- =============================================================
-- Case ID: TC_PROCEDURE_CALL_STATEMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_CALL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.4
-- Production: procedure_call_statement ::= [ label : ] procedure_call ;
-- Case Type: Negative
-- Test Focus: SNN: missing semicolon — `proc_name(args)` is followed directly by a newline with no semicolon, verifying that a procedure_call_statement must be terminated by a semicolon
-- Expected Result: Triggers syntax error: missing ';' after procedure call statement
-- Dependencies: None
-- =============================================================
entity proc_stmt_nosemi_ent is
  port (val : in integer; result : out integer);
end entity proc_stmt_nosemi_ent;

architecture err of proc_stmt_nosemi_ent is
  procedure set_val(signal dest : out integer; v : integer) is
  begin
    dest <= v;
  end procedure;
begin
  process(val) is
  begin
    set_val(result, val)  -- ERROR: missing semicolon
    set_val(result, 0);
  end process;
end architecture err;
