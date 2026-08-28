-- =============================================================
-- Case ID: TC_PACKAGE_INSTANTIATION_DECLARATION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_INSTANTIATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.6
-- Production: package_instantiation_declaration ::= package identifier is new uninstantiated_package_name [ generic_map_aspect ] ;
-- Case Type: Positive
-- Test Focus: package instantiation with type generic and subprogram usage, verifying package_instantiation_declaration in a complete design unit context with package body and entity
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package counter_pkg is
  generic(type cnt_t);
  function f_inc(v:cnt_t) return cnt_t;
end package;
package body counter_pkg is
  function f_inc(v:cnt_t) return cnt_t is begin return v; end function;
end package body;
package p_bit_counter is new work.counter_pkg generic map(cnt_t=>bit_vector(3 downto 0));
entity pi_counter_ent is port(clk:in bit; cnt:out bit_vector(3 downto 0)); end entity;
architecture bh of pi_counter_ent is
  signal s_cnt:bit_vector(3 downto 0):=(others=>'0');
begin
  process(clk) begin
    if clk'event and clk='1' then s_cnt<=work.p_bit_counter.f_inc(s_cnt); end if;
  end process;
  cnt<=s_cnt;
end architecture bh;
