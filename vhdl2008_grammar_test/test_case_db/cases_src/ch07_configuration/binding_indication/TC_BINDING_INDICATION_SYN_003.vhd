-- =============================================================
-- Case ID: TC_BINDING_INDICATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.2.1
-- Production: binding_indication ::= [ use entity_aspect ] [ generic_map_aspect ] [ port_map_aspect ]
-- Case Type: Positive
-- Test Focus: binding_indication with use open — entity_aspect as 'open' indicating no binding, used in a configuration specification for unbound components
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bind_ind_open_ent is
  port(din : in bit_vector(7 downto 0); dout : out bit_vector(7 downto 0));
end entity;

architecture bh of bind_ind_open_ent is
  component unbound_buf is
    port(d : in bit_vector(7 downto 0); q : out bit_vector(7 downto 0));
  end component;
  for u_buf : unbound_buf use open;
  signal s_buf : bit_vector(7 downto 0) := (others => '0');
begin
  u_buf : unbound_buf port map(d=>din, q=>s_buf);
  dout <= s_buf;
end architecture bh;
