-- =============================================================
-- Case ID: TC_CONCURRENT_SELECTED_SIGNAL_ASSIGNMENT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_SELECTED_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_selected_signal_assignment ::= with expression select [ ? ] target <= [ guarded ] [ delay_mechanism ] selected_waveforms ;
-- Case Type: Negative
-- Test Focus: SNN: selected waveform branch missing when — in `with sel select y <= a '0', b when '1';` the first choice value has no when before it, verifying that every selected waveform must introduce its choice with when
-- Expected Result: Triggers syntax error: missing "when" in selected waveform
-- Dependencies: None
-- =============================================================
entity cssa_snn5_ent is
  port(a, b, sel : in bit; y : out bit);
end entity cssa_snn5_ent;
architecture bh of cssa_snn5_ent is
begin
  with sel select
    y <= a '0',
         b when '1';
end architecture bh;
