-- =============================================================
-- Case ID: TC_CONCURRENT_SELECTED_SIGNAL_ASSIGNMENT_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONCURRENT_SELECTED_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_selected_signal_assignment ::= with expression select [ ? ] target <= [ guarded ] [ delay_mechanism ] selected_waveforms ;
-- Rule Description: Selected signal assignments require all possible values of the select expression to be covered; the "others" choice is mandatory if not all values are explicitly listed. Each choice must be locally static and unique.
-- Case Type: Positive
-- Test Focus: full coverage without others — the expression is bit with only two values, and the two when branches '0' and '1' are listed explicitly with no others, verifying that the others clause is not needed when all possible values are explicitly covered
-- Expected Result: Compiles successfully; all select expression values explicitly covered
-- Dependencies: None
-- =============================================================
entity cssa_sem2_ent is
  port(a, b, sel : in bit; y : out bit);
end entity cssa_sem2_ent;
architecture bh of cssa_sem2_ent is
begin
  with sel select
    y <= a when '0',
         b when '1';
end architecture bh;
