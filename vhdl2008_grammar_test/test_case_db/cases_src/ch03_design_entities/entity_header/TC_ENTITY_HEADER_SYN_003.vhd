-- =============================================================
-- Case ID: TC_ENTITY_HEADER_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_header ::= [ formal_generic_clause ] [ formal_port_clause ]
-- Case Type: Positive
-- Test Focus: entity_header all combinations — generic+port coexistence interaction: generic_clause(2 generics: G_W controlling width, G_D controlling delay) + port_clause(bit_vector sizes of 4 ports referencing the G_W value), verifying generic and port can coexist in entity_header and the port subtype_indication can reference a generic name declared in the same header
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity eh_full is
  generic(
    G_W : integer := 16;
    G_D : time    := 500 ps
  );
  port(
    din  : in  bit_vector(G_W-1 downto 0);
    dout : out bit_vector(G_W-1 downto 0);
    clk  : in  bit;
    rst  : in  bit
  );
end entity;
architecture bh of eh_full is
  signal s_reg : bit_vector(G_W-1 downto 0) := (others=>'0');
begin
  process(clk,rst)
  begin
    if rst='1' then s_reg<=(others=>'0');
    elsif clk'event and clk='1' then s_reg<=din; end if;
  end process;
  dout<=s_reg after G_D;
end architecture bh;
