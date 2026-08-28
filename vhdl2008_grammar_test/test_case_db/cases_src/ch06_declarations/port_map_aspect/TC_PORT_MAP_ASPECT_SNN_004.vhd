-- =============================================================
-- Case ID: TC_PORT_MAP_ASPECT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PORT_MAP_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: port_map_aspect ::= port map ( port_association_list )
-- Case Type: Negative
-- Test Focus: ERROR: port_map_aspect uses "=>" arrow but the left side is not a valid formal_designator (it is an expression).
-- Expected Result: Triggers syntax error (invalid formal)
-- Dependencies: None
-- =============================================================
entity port_map_aspect_snn4 is
  port (
    a : in bit; b : out bit
  );
end entity port_map_aspect_snn4;

architecture arch of port_map_aspect_snn4 is
  component inv is
    port (input : in bit; output : out bit);
  end component;
begin
  u_inv : inv
    port map (
      a and '1' => input,
      output => b
    );
end architecture arch;
