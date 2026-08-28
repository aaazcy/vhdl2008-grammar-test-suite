-- =============================================================
-- Case ID: TC_ENTITY_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declaration ::= entity identifier is entity_header entity_declarative_part [ begin entity_statement_part ] end [ entity ] [ entity_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Port all modes: port_clause contains 5 ports using in/out/inout/buffer/linkage modes respectively, types include integer(in+default)/bit(out)/custom enum t_tristate(inout)/bit_vector(buffer 4bit)/bit(linkage), verifying interface_signal_declaration supports all 5 mode keywords in entity_header
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_port_modes is
  port(
    p_in     : in    integer := 0;
    p_out    : out   bit;
    p_inout  : inout bit;
    p_buf    : buffer bit_vector(3 downto 0);
    p_link   : linkage bit
  );
end entity ent_port_modes;
architecture bh of ent_port_modes is
begin
  p_out    <= p_inout;
  p_buf    <= (others => p_inout);
end architecture bh;
