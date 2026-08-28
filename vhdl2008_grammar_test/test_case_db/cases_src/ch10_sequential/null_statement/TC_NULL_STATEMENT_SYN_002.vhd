-- =============================================================
-- Case ID: TC_NULL_STATEMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_NULL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.14
-- Production: null_statement ::= [ label : ] null ;
-- Case Type: Positive
-- Test Focus: with label: `do_nothing: null;` — verifying that a null statement can carry an optional label prefix
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity null_labeled_ent is
  port (en : in boolean; pass : out boolean);
end entity null_labeled_ent;

architecture labeled of null_labeled_ent is
begin
  process(en) is
  begin
    skip_action: null;
    pass <= en;
  end process;
end architecture labeled;
