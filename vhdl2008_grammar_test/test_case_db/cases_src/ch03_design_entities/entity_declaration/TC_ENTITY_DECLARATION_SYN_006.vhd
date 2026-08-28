-- =============================================================
-- Case ID: TC_ENTITY_DECLARATION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declaration ::= entity identifier is entity_header entity_declarative_part [ begin entity_statement_part ] end [ entity ] [ entity_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Declarative part — types/subtypes: entity_declarative_part defines integer type(t_word 0..65535)/enum type(t_level LOW,HIGH,UNDEF)/array type 1D+2D/record type(t_bus cmd+addr+data)/physical type(t_res with Ohm/kOhm)/floating type(t_volt 0.0..5.0)/subtype, verifying the entity-level declarative part supports all scalar and composite type definitions
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_decl_types is
  port(status : out integer);
end entity ent_decl_types;
architecture bh of ent_decl_types is
  type t_word  is range 0 to 65535;
  type t_level is (LOW, HIGH, UNDEF);
  type t_byte_arr is array(7 downto 0) of bit;
  type t_grid    is array(0 to 3, 0 to 3) of integer;
  type t_bus is record
    cmd  : bit_vector(3 downto 0);
    addr : integer range 0 to 1023;
    data : bit_vector(15 downto 0);
  end record;
  type t_res is range 0 to 1000000 units Ohm; kOhm=1000 Ohm; end units;
  type t_volt is range 0.0 to 5.0;
  subtype t_nibble is bit_vector(3 downto 0);
  signal s_word  : t_word  := 0;
  signal s_level : t_level := LOW;
  signal s_bus   : t_bus   := (cmd=>"0000", addr=>0, data=>(others=>'0'));
begin
  s_word <= 42;
  status <= integer(s_word);
end architecture bh;
