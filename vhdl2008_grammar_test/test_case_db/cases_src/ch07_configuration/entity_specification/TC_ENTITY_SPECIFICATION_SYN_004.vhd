-- =============================================================
-- Case ID: TC_ENTITY_SPECIFICATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_specification ::= entity_name_list : entity_class
-- Case Type: Positive
-- Test Focus: entity_specification with entity_class "entity" and entity_name_list "all" using extended identifier -- exercises the entity_class value "entity" applied to all design entities in scope via the "all" reserved word, testing that entity_class for design entity is recognized correctly
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity espec_entity_class is
  port(
    req   : in  bit;
    ack   : out bit;
    data  : in  bit_vector(7 downto 0)
  );
  attribute resource_usage : string;
  attribute resource_usage of espec_entity_class : entity is "handshake_fsm";
end entity;

architecture fsm of espec_entity_class is
  type t_state is (IDLE, BUSY, DONE);
  signal state : t_state := IDLE;
  signal data_reg : bit_vector(7 downto 0) := X"00";
begin
  process(req)
  begin
    case state is
      when IDLE =>
        if req = '1' then state <= BUSY; end if;
        ack <= '0';
      when BUSY =>
        data_reg <= data;
        state <= DONE;
      when DONE =>
        ack <= '1';
        if req = '0' then state <= IDLE; end if;
    end case;
  end process;
end architecture fsm;
