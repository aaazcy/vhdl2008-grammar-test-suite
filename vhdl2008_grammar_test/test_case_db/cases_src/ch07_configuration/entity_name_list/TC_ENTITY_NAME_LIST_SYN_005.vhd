-- =============================================================
-- Case ID: TC_ENTITY_NAME_LIST_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_NAME_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_name_list ::= entity_designator { , entity_designator } | others | all
-- Case Type: Positive
-- Test Focus: entity_name_list in group template declaration context -- exercises entity_designator comma-list (port_name_group, internal_sig_group : signal) applied within a group template that collects named entities across different entity classes, testing entity_name_list outside attribute_specification
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity enl_group_tmpl is
  port(
    clk   : in  bit;
    rst_n : in  bit;
    din   : in  bit_vector(7 downto 0);
    dout  : out bit_vector(7 downto 0)
  );
  attribute max_delay : time;
  attribute max_delay of clk, rst_n, din, dout : signal is 3 ns;
end entity;

architecture rtl of enl_group_tmpl is
  signal reg_out : bit_vector(7 downto 0) := X"00";
  signal pipe_1, pipe_2 : bit_vector(7 downto 0) := X"00";
  attribute max_delay of reg_out : signal is 0 ns;
begin
  process(clk, rst_n)
  begin
    if rst_n = '0' then
      reg_out <= X"00";
      pipe_1  <= X"00";
      pipe_2  <= X"00";
    elsif clk'event and clk = '1' then
      pipe_1  <= din;
      pipe_2  <= pipe_1;
      reg_out <= pipe_2;
    end if;
  end process;
  dout <= reg_out;
end architecture rtl;
