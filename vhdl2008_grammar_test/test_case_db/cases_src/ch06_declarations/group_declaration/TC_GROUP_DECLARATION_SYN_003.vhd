-- =============================================================
-- Case ID: TC_GROUP_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_GROUP_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_declaration ::= group identifier : group_template_name ( group_constituent_list ) ;
-- Case Type: Positive
-- Test Focus: group_declaration: group declaration using constants and signals as constituents
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gd_mixed_constituents_syn is
  port (
    reg_out : out integer;
    ctrl_out : out bit
  );
end entity gd_mixed_constituents_syn;

architecture focused of gd_mixed_constituents_syn is
  group reg_bank is (signal, constant, constant <>);
  signal s_counter : integer := 0;
  constant C_MAX_COUNT : integer := 255;
  constant C_OFFSET    : integer := 10;
  group counter_regs : reg_bank (s_counter, C_MAX_COUNT, C_OFFSET);
begin
  s_counter <= (s_counter + 1) mod 256 after 5 ns;
  reg_out  <= s_counter;
  ctrl_out <= '1' when s_counter < C_MAX_COUNT else '0';
end architecture focused;
