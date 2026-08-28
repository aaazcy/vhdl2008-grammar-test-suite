-- =============================================================
-- Case ID: TC_SIMPLE_FORCE_ASSIGNMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_force_assignment ::= target <= force [ force_mode ] expression ;
-- Case Type: Positive
-- Test Focus: Simple force assignment with in mode targeting a bit_vector signal using an aggregate expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity simple_force_syn_005 is
end entity simple_force_syn_005;

architecture test of simple_force_syn_005 is
  signal s_bus : bit_vector(7 downto 0) := (others => '0');
begin
  process is
  begin
    s_bus <= force in (7 => '1', 3 => '1', others => '0');
    wait for 25 ns;
    s_bus <= release in;
    wait;
  end process;
end architecture test;
