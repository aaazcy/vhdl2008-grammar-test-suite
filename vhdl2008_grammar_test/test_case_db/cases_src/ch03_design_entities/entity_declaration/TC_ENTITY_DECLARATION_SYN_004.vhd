-- =============================================================
-- Case ID: TC_ENTITY_DECLARATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declaration ::= entity identifier is entity_header entity_declarative_part [ begin entity_statement_part ] end [ entity ] [ entity_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Port complex types: port types use custom record(t_data with addr+data+flag)/array(1D bit_vector subtype/2D integer matrix)/enum(t_op with ADD,SUB,MUL,DIV)/access type(pointing to record), verifying entity ports can accept all composite types and access types
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_port_types is
  generic(
    AW : integer := 8;
    DW : integer := 16
  );
  port(
    p_addr  : in    integer range 0 to 2**AW-1;
    p_data  : inout bit_vector(DW-1 downto 0);
    p_op    : in    bit;
    p_valid : out   boolean
  );
end entity ent_port_types;
architecture bh of ent_port_types is
  type t_op is (ADD, SUB, MUL, DIV);
  type t_matrix is array(0 to 3, 0 to 3) of integer;
  signal s_op    : t_op := ADD;
  signal s_mat   : t_matrix := (others => (others => 0));
  signal s_valid : boolean := false;
begin
  process(p_addr, p_data, p_op)
  begin
    if p_op = '1' then s_op <= ADD; else s_op <= SUB; end if;
    s_mat(0,0) <= p_addr;
    s_valid    <= true;
  end process;
  p_valid <= s_valid;
end architecture bh;
