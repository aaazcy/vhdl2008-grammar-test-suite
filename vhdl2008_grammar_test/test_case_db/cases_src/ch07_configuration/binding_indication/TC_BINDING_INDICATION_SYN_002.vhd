-- =============================================================
-- Case ID: TC_BINDING_INDICATION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.2.1
-- Production: binding_indication ::= [ use entity_aspect ] [ generic_map_aspect ] [ port_map_aspect ]
-- Case Type: Positive
-- Test Focus: binding_indication with use configuration — entity_aspect as configuration config_name variant, testing the configuration alternative of the entity_aspect production within binding_indication
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
-- Supporting design units for the configuration referenced by the binding indication
entity inv_gate is
  port(a : in bit; y : out bit);
end entity inv_gate;

architecture rtl of inv_gate is
begin
  y <= not a;
end architecture rtl;

configuration bind_inv_cfg of inv_gate is
  for rtl
  end for;
end configuration bind_inv_cfg;

entity bind_ind_cfg_ent is
  port(din : in bit; dout : out bit);
end entity;

architecture bh of bind_ind_cfg_ent is
  component inv is
    port(a : in bit; y : out bit);
  end component;
  for u_inv : inv
    use configuration work.bind_inv_cfg;
  signal s_y : bit := '0';
begin
  u_inv : inv port map(a=>din, y=>dout);
end architecture bh;
