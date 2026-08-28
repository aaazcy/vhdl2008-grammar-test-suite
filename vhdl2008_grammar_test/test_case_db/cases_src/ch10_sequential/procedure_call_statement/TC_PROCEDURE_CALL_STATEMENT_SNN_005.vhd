-- =============================================================
-- Case ID: TC_PROCEDURE_CALL_STATEMENT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_CALL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.4
-- Production: procedure_call_statement ::= [ label : ] procedure_call ;
-- Case Type: Negative
-- Test Focus: SNN: procedure_name misspelled — `writ_fifo(data);` uses a nonexistent procedure name, verifying that the name in a procedure_call must reference a declared procedure
-- Expected Result: Triggers syntax error: undefined procedure name
-- Dependencies: None
-- =============================================================
entity proc_stmt_badname_ent is
  port (d : in bit; q : out bit);
end entity proc_stmt_badname_ent;

architecture err of proc_stmt_badname_ent is
  procedure store_bit(val : in bit) is
  begin
    q <= val;
  end procedure;
begin
  process(d) is
  begin
    stor_bit(d);  -- ERROR: misspelled procedure name
  end process;
end architecture err;
