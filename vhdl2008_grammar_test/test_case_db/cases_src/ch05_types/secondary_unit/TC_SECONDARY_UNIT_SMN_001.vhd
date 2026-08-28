-- =============================================================
-- Case ID: TC_SECONDARY_UNIT_SMN_001
-- Rule Type: Static Model
-- Related Rule ID: BNF_SECONDARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: secondary_unit ::= architecture_body | package_body
-- Case Type: Negative
-- Test Focus: ERROR: architecture body with signal driving output but no entity port match
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
-- ERROR: architecture body with signal driving output but no entity port match
entity sec_unit_smn_port_mismatch is port(dout:out bit); end entity;
architecture rtl of sec_unit_smn_port_mismatch is
  signal s:integer:=0;
begin dout<=s;  -- ERROR: integer signal assigned to bit port
end architecture;