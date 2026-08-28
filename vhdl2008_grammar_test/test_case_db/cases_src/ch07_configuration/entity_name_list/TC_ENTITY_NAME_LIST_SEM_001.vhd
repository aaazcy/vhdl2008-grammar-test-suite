-- =============================================================
-- Case ID: TC_ENTITY_NAME_LIST_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_ENTITY_NAME_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_name_list ::= entity_designator { , entity_designator } | others | all
-- Case Type: Positive (Semantic)
-- Test Focus: Semantic resolution of "others" entity_name_list -- the keyword "others" in entity_name_list semantically refers to all previously unnamed entities of the given entity_class within the declarative region; this test verifies that "others : signal" in an attribute specification correctly targets the remaining undeclared signals without naming conflicts against already-specified signals
-- Expected Result: Compiles successfully; "others" targets only unnamed signals
-- Dependencies: None
-- =============================================================
entity enl_sem_others is
  port(
    clk  : in  bit;
    din  : in  bit_vector(3 downto 0);
    dout : out bit_vector(3 downto 0)
  );
  attribute syn_preserve : boolean;
  -- Explicitly name some signals
  attribute syn_preserve of clk, din, dout : signal is true;
end entity;

architecture rtl of enl_sem_others is
  signal reg_q  : bit_vector(3 downto 0) := "0000";
  signal reg_d  : bit_vector(3 downto 0) := "0000";
  signal valid  : bit := '0';
  -- "others" refers to all remaining signals not yet named
  attribute syn_preserve of others : signal is false;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      reg_q <= din;
      valid <= '1';
    end if;
  end process;
  dout <= reg_q;
end architecture rtl;
