-- =============================================================
-- Case ID: TC_ENTITY_DECLARATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declaration ::= entity identifier is entity_header entity_declarative_part [ begin entity_statement_part ] end [ entity ] [ entity_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Generic+Port coexistence interaction: 2 generics(G_DATA_W:integer controlling data width, G_ADDR_W:integer controlling address width) and 5 ports(clk/rst_n/din/dout/addr)——port bit_vector sizes are derived from generic values, verifying generic_clause and port_clause can coexist in entity_header and the port subtype_indication can reference generic names
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_gen_port is
  generic(
    G_DATA_W : integer := 16;
    G_ADDR_W : integer := 8
  );
  port(
    clk   : in  bit;
    rst_n : in  bit;
    din   : in  bit_vector(G_DATA_W-1 downto 0);
    addr  : in  integer range 0 to 2**G_ADDR_W-1;
    dout  : out bit_vector(G_DATA_W-1 downto 0)
  );
end entity ent_gen_port;
architecture bh of ent_gen_port is
  signal s_reg : bit_vector(G_DATA_W-1 downto 0) := (others => '0');
begin
  process(clk, rst_n)
  begin
    if rst_n = '0' then s_reg <= (others => '0');
    elsif clk'event and clk = '1' then s_reg <= din; end if;
  end process;
  dout <= s_reg;
end architecture bh;
