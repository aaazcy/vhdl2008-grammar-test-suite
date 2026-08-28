-- =============================================================
-- Case ID: TC_RECORD_TYPE_DEFINITION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_RECORD_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.6
-- Production: record_type_definition ::= record element_declaration { element_declaration } end record [ record_simple_name ]
-- Case Type: Positive
-- Test Focus: Record type used as entity port type, exercising record_type_definition in a context where the record is referenced in a port clause for structural connectivity
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rec_port_ent is
  port(
    clk    : in  bit;
    addr   : in  integer range 0 to 255;
    status : out bit_vector(1 downto 0)
  );
end entity;
architecture rec_port_arch of rec_port_ent is
  type t_bus_cmd is record
    wr_en   : bit;
    addr    : integer range 0 to 255;
    data    : bit_vector(7 downto 0);
  end record t_bus_cmd;
  signal cmd : t_bus_cmd;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      cmd.wr_en <= '1';
      cmd.addr  <= addr;
      cmd.data  <= "00000000";
      status <= cmd.wr_en & '0';
    end if;
  end process;
end architecture rec_port_arch;
