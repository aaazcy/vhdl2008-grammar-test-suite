-- =============================================================
-- Case ID: TC_INDEX_SUBTYPE_DEFINITION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INDEX_SUBTYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: index_subtype_definition ::= type_mark range <>
-- Case Type: Positive
-- Test Focus: index_subtype_definition with enumeration type_mark.
--            A bus protocol analyzer indexed by protocol state
--            with variable state count.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity protocol_state_machine is
  port (
    clk        : in  bit;
    transition : in  integer range 0 to 5;
    cur_state  : out integer range 0 to 5
  );
end entity protocol_state_machine;

architecture rtl of protocol_state_machine is
  type axi_state is (IDLE, ADDR, DATA, RESP, BURST, DONE);
  -- index_subtype_definition: type_mark = axi_state (enumeration), range <>
  type state_vector is array (axi_state range <>) of bit;
  subtype full_state_vec is state_vector(IDLE to DONE);
  signal active_states : full_state_vec := (others => '0');
  signal state_idx     : axi_state := IDLE;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      case transition is
        when 0 => state_idx <= IDLE;
        when 1 => state_idx <= ADDR;
        when 2 => state_idx <= DATA;
        when 3 => state_idx <= RESP;
        when 4 => state_idx <= BURST;
        when 5 => state_idx <= DONE;
        when others => state_idx <= IDLE;
      end case;
      active_states(state_idx) <= '1';
      cur_state <= transition;
    end if;
  end process;
end architecture rtl;
