-- =============================================================
-- Case ID: TC_GROUP_CONSTITUENT_LIST_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_GROUP_CONSTITUENT_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_constituent_list ::= group_constituent { , group_constituent }
-- Case Type: Positive
-- Test Focus: group_constituent_list: multi-element list with three constituents (names and character literals)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gcl_multi_element_syn is
  port (
    data_out : out bit_vector(7 downto 0);
    ctrl_out : out bit
  );
end entity gcl_multi_element_syn;

architecture focused of gcl_multi_element_syn is
  group mixed_group is (signal, constant, literal <>);
  signal s_data : bit_vector(7 downto 0) := X"00";
  constant C_ENABLE : bit := '1';
  type t_state is (IDLE, RUN);
  group pipeline : mixed_group (s_data, C_ENABLE, RUN);
begin
  s_data <= X"AB" after 5 ns;
  ctrl_out <= C_ENABLE;
  data_out <= s_data;
end architecture focused;
