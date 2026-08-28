-- =============================================================
-- Case ID: TC_PROCEDURE_CALL_STATEMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_CALL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.4
-- Production: procedure_call_statement ::= [ label : ] procedure_call ;
-- Case Type: Negative
-- Test Focus: SNN: no procedure_call after label — `lbl: ;` has a null statement after the label colon, verifying that a valid procedure_call must follow the label
-- Expected Result: Triggers syntax error: expected procedure call after label
-- Dependencies: None
-- =============================================================
entity proc_stmt_label_empty_ent is
  port (a : in bit; b : out bit);
end entity proc_stmt_label_empty_ent;

architecture err of proc_stmt_label_empty_ent is
begin
  process(a) is
  begin
    call_proc: ;  -- ERROR: label followed by empty, no procedure call
    b <= a;
  end process;
end architecture err;
