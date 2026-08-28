-- =============================================================
-- Case ID: TC_ENTITY_SPECIFICATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_specification ::= entity_name_list : entity_class
-- Case Type: Positive
-- Test Focus: entity_specification with entity_class "architecture" targeting a named architecture body -- exercises entity_name_list using a single entity_designator (architecture name "pipeline") with entity_class "architecture" to attach an attribute directly to an architecture body
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity espec_arch_class is
  port(
    clk    : in  bit;
    din    : in  bit_vector(15 downto 0);
    dout   : out bit_vector(15 downto 0)
  );
end entity;

architecture pipeline of espec_arch_class is
  attribute latency_cycles : integer;
  attribute latency_cycles of pipeline : architecture is 3;

  signal s1, s2, s3 : bit_vector(15 downto 0) := X"0000";
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s1 <= din;
      s2 <= s1;
      s3 <= s2;
    end if;
  end process;
  dout <= s3;
end architecture pipeline;
