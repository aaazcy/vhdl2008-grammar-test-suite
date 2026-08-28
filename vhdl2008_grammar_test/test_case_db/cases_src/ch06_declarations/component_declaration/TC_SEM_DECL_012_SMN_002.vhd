-- =============================================================
-- Case ID: TC_SEM_DECL_012_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_DECL_012
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Rule Description: Component local port names must be unique
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Component declaration with duplicate port names
-- Expected Result: Triggers semantic error: declaration_elaboration_error
-- Dependencies: None
-- =============================================================
entity tc_sem_decl_012_smn_002 is port(r:out integer); end entity;
architecture bh of tc_sem_decl_012_smn_002 is
  -- ERROR: duplicate port name "clk" in component
  component comp_dup_ports is
    port(clk:in bit; rst:in bit; clk:out bit);
  end component;
  signal s_clk, s_rst, s_out : bit;
begin
  u_comp: comp_dup_ports port map(clk=>s_clk, rst=>s_rst, clk=>s_out);
  r <= 1;
end architecture bh;
