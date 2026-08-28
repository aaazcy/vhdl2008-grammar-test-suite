-- =============================================================
-- Case ID: TC_NULL_STATEMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_NULL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.14
-- Production: null_statement ::= [ label : ] null ;
-- Case Type: Negative
-- Test Focus: SNN: no null after label colon — label written as `lbl: ;` missing the null statement body, verifying that the null keyword must follow the label colon
-- Expected Result: Triggers syntax error: expected statement after label
-- Dependencies: None
-- =============================================================
entity null_label_only_ent is
  port (a : in bit; b : out bit);
end entity null_label_only_ent;

architecture err of null_label_only_ent is
begin
  process(a) is
  begin
    empty_op: ;  -- ERROR: label followed by empty statement
    b <= a;
  end process;
end architecture err;
