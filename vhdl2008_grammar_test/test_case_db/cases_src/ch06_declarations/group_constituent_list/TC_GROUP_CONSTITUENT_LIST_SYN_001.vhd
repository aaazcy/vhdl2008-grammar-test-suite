-- =============================================================
-- Case ID: TC_GROUP_CONSTITUENT_LIST_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_GROUP_CONSTITUENT_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_constituent_list ::= group_constituent { , group_constituent }
-- Case Type: Positive
-- Test Focus: group_constituent_list: single element list in a group declaration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gcl_single_element_syn is
  port (
    addr_out : out bit_vector(3 downto 0)
  );
end entity gcl_single_element_syn;

architecture focused of gcl_single_element_syn is
  group bus_group is (signal <>);
  signal s_addr : bit_vector(3 downto 0) := "0000";
  group addr_bus : bus_group (s_addr);
begin
  s_addr <= "1010" after 5 ns;
  addr_out <= s_addr;
end architecture focused;
