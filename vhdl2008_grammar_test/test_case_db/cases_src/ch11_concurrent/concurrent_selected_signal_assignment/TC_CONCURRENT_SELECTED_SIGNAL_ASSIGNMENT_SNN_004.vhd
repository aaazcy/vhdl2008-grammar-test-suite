-- =============================================================
-- Case ID: TC_CONCURRENT_SELECTED_SIGNAL_ASSIGNMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_SELECTED_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_selected_signal_assignment ::= with expression select [ ? ] target <= [ guarded ] [ delay_mechanism ] selected_waveforms ;
-- Case Type: Negative
-- Test Focus: SNN: missing "select" keyword — in `with sel y <= a when '0', b when '1';` there is no select after the expression, verifying that the with expression must be followed by select
-- Expected Result: Triggers syntax error: missing "select" after with expression
-- Dependencies: None
-- =============================================================
entity cssa_snn4_ent is
  port(a, b, sel : in bit; y : out bit);
end entity cssa_snn4_ent;
architecture bh of cssa_snn4_ent is
begin
  with sel
    y <= a when '0',
         b when '1';
end architecture bh;
