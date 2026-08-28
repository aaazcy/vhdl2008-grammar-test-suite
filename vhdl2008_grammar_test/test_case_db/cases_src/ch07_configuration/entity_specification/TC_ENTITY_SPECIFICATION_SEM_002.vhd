-- =============================================================
-- Case ID: TC_ENTITY_SPECIFICATION_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_ENTITY_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_specification ::= entity_name_list : entity_class
-- Case Type: Positive (Semantic)
-- Test Focus: Semantic entity_specification with multiple entity_classes -- verifies that distinct entity_specification instances correctly separate entity names by their entity_class; signals, labels, and architectures each get attributes through their respective entity_specifications, with the compiler semantically validating that each entity_designator belongs to the declared entity_class
-- Expected Result: Compiles successfully; attributes correctly bound per entity_class
-- Dependencies: None
-- =============================================================
entity espec_sem_multi is
  port(
    clk   : in  bit;
    rst_n : in  bit;
    data  : in  bit_vector(7 downto 0);
    q_out : out bit_vector(7 downto 0)
  );
  attribute syn_attr : string;

  -- entity_class "entity" for the design entity itself
  attribute syn_attr of espec_sem_multi : entity is "top_level";

  -- entity_class "signal" for port signals
  attribute syn_attr of clk, rst_n : signal is "control_path";
  attribute syn_attr of data, q_out : signal is "data_path";
end entity;

architecture behavioral of espec_sem_multi is
  -- entity_class "architecture" for the architecture body
  attribute syn_attr of behavioral : architecture is "fsm_driven";

  signal reg_q  : bit_vector(7 downto 0) := X"00";
  attribute syn_attr of reg_q : signal is "pipeline_reg";

  type t_state is (S_RESET, S_IDLE, S_ACTIVE);
  signal curr_state : t_state := S_RESET;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if rst_n = '0' then
        curr_state <= S_RESET;
        reg_q <= X"00";
      else
        case curr_state is
          when S_RESET =>
            curr_state <= S_IDLE;
          when S_IDLE =>
            reg_q <= data;
            curr_state <= S_ACTIVE;
          when S_ACTIVE =>
            reg_q <= data;
        end case;
      end if;
    end if;
  end process;
  q_out <= reg_q;
end architecture behavioral;
