-- =============================================================
-- Case ID: TC_CONCURRENT_SELECTED_SIGNAL_ASSIGNMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_SELECTED_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_selected_signal_assignment ::= with expression select [ ? ] target <= [ guarded ] [ delay_mechanism ] selected_waveforms ;
-- Case Type: Positive
-- Test Focus: with delay_mechanism — `with sel select y <= transport a after 1 ns when '0', b after 2 ns when '1';` uses transport delay in the select, verifying that a selected waveform can specify a delay mechanism
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cssa_delay_ent is
  port(a, b, sel : in bit; y : out bit);
end entity cssa_delay_ent;
architecture bh of cssa_delay_ent is
begin
  with sel select
    y <= transport a after 1 ns when '0',
                  b after 2 ns when '1';
end architecture bh;
