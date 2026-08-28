-- =============================================================
-- Case ID: TC_PACKAGE_HEADER_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_HEADER
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Positive
-- Test Focus: package_header: generic_clause with multiple generics and generic_map_aspect — exercises multiple generics in the generic_clause followed by a generic_map_aspect that maps all of them, demonstrating a complete generic package header instantiation
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pkg_header_multi_generic is
  generic (
    G_ADDR_W : natural := 4;
    G_DATA_W : natural := 8;
    G_EN_PIPE : boolean := false
  );
  port (
    addr : in  bit_vector(G_ADDR_W - 1 downto 0);
    dout : out bit_vector(G_DATA_W - 1 downto 0)
  );
end entity;

architecture test of pkg_header_multi_generic is
  type mem_t is array(0 to 2**G_ADDR_W - 1) of bit_vector(G_DATA_W - 1 downto 0);
  constant C_MEM : mem_t := (others => (others => '0'));

  function f_addr_to_idx(a : bit_vector) return natural is
    variable idx : natural := 0;
  begin
    for i in a'range loop
      if a(i) = '1' then
        idx := idx + 2**i;
      end if;
    end loop;
    return idx;
  end function;
begin
  dout <= C_MEM(f_addr_to_idx(addr));
end architecture test;
