-- =============================================================
-- Case ID: TC_SIGNAL_KIND_SYN_S01
-- Rule Type: Syntax
-- BNF Production: SIGNAL_KIND
-- Standard Reference: IEEE 1076-2008 Section 6.5
-- Test Focus: Signal kind: register ｜ bus — guarded signal kind specifiers
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_signal_kind_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_signal_kind_syn_s01 is
begin
  r<=42;end architecture bh;
