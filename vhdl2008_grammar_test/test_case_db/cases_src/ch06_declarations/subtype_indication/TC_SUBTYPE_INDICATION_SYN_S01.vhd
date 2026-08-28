-- =============================================================
-- Case ID: TC_SUBTYPE_INDICATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: SUBTYPE_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Test Focus: Subtype indication: [resolution_indication] type_mark [constraint] — used everywhere types are referenced
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_subtype_indication_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_subtype_indication_syn_s01 is
  signal s_si:integer range 0 to 15:=0;  -- subtype_indication inline
begin
  s_si<=15; r<=s_si;end architecture bh;
