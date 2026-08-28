-- =============================================================
-- Case ID: TC_SUBTYPE_DECLARATION_SMN_001
-- Rule Type: Static Model
-- Related Rule ID: BNF_SUBTYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: subtype_declaration ::= subtype identifier is subtype_indication ;
-- Case Type: Negative
-- Test Focus: static model negative -- assignment outside subtype range
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity sd_smn_oob is port(dout:out integer); end entity;
architecture rtl of sd_smn_oob is
  subtype t_nibble is integer range 0 to 15;
  signal s:t_nibble:=20;  -- ERROR: 20 outside 0..15
begin dout<=s; end architecture;