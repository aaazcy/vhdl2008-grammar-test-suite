-- =============================================================
-- Case ID: TC_EXTERNAL_SIGNAL_NAME_SYN_S01
-- Rule Type: Syntax
-- BNF Production: EXTERNAL_SIGNAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_signal_name ::= << signal external_pathname : subtype_indication >>
-- Case Type: Positive (Production-Specific)
-- Test Focus: External signal name with relative pathname —
--   <<signal ^.parent_inst.ack : bit>> uses single-level upward reference
--   to access an acknowledgment signal from the parent instance boundary.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_sig_rel_ack is
  port(
    local_req : in  bit;
    ack_out   : out bit
  );
end entity ext_sig_rel_ack;

architecture vhdl2008 of ext_sig_rel_ack is
  alias parent_ack is <<signal ^.parent_inst.ack : bit>>;
begin
  ack_out <= parent_ack and local_req;
end architecture vhdl2008;
