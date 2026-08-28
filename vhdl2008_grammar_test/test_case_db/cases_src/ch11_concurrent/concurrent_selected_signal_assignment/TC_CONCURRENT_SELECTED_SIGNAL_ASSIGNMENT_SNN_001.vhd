-- =============================================================
-- Case ID: TC_CONCURRENT_SELECTED_SIGNAL_ASSIGNMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_SELECTED_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_selected_signal_assignment ::= with expression select [ ? ] target <= [ guarded ] [ delay_mechanism ] selected_waveforms ;
-- Case Type: Negative
-- Test Focus: SNN: missing "with" keyword — `sel select y <= a when '0', b when '1';` does not begin with with, verifying that a selected signal assignment must start with the with keyword
-- Expected Result: Triggers syntax error: missing "with" in selected signal assignment
-- Dependencies: None
-- =============================================================
entity cssa_snn1_ent is
  port(a, b, sel : in bit; y : out bit);
end entity cssa_snn1_ent;
architecture bh of cssa_snn1_ent is
begin
  sel select
    y <= a when '0',
         b when '1';
end architecture bh;
