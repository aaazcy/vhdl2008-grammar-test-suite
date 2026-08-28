-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_ITEM_SYN_012
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declarative_item ::= ... | package_declaration | ... (22 alternatives)
-- Case Type: Positive
-- Test Focus: package_declaration as entity_declarative_item — the entity declarative part defines the local package pkg_params containing constant C_CLK_PERIOD=10 ns and type t_state, verifying package_declaration is legal in the entity declarative part, package contents are visible in the entity scope
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity edi_pkg_ent is
  port(clk:in bit; period_out:out integer);
  package pkg_params is
    constant C_CLK_PERIOD:time:=10 ns;
    type t_state is (s_idle,s_active,s_done);
  end package pkg_params;
end entity edi_pkg_ent;
architecture bh of edi_pkg_ent is
  signal s_state:pkg_params.t_state:=pkg_params.s_idle;
begin
  process(clk) begin
    if clk'event and clk='1' then
      case s_state is
        when pkg_params.s_idle=>s_state<=pkg_params.s_active;
        when pkg_params.s_active=>s_state<=pkg_params.s_done;
        when pkg_params.s_done=>s_state<=pkg_params.s_idle;
      end case;
    end if;
  end process;
  period_out<=pkg_params.C_CLK_PERIOD/1 ns;
end architecture bh;
