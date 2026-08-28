-- =============================================================
-- Case ID: TC_TYPE_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: type_declaration ::= full_type_declaration | incomplete_type_declaration
-- Case Type: Positive
-- Test Focus: Exercises type_declaration via full_type_declaration path with a range-constrained integer type for an address decoder.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity type_decl_syn1 is
  port (
    addr   : in  bit_vector(3 downto 0);
    sel    : out bit_vector(15 downto 0)
  );
end entity type_decl_syn1;

architecture rtl of type_decl_syn1 is
  type t_addr_range is range 0 to 15;
  type t_sel_vector is array(t_addr_range) of bit;
  signal s_sel : t_sel_vector := (others => '0');
begin
  process(addr)
    variable v_idx : t_addr_range;
  begin
    v_idx := 0;
    for i in 0 to 3 loop
      if addr(i) = '1' then
        v_idx := v_idx + 2**i;
      end if;
    end loop;
    s_sel <= (others => '0');
    s_sel(v_idx) <= '1';
  end process;

  gen_out: for i in t_addr_range generate
    sel(t_addr_range'pos(i)) <= s_sel(i);
  end generate;
end architecture rtl;
