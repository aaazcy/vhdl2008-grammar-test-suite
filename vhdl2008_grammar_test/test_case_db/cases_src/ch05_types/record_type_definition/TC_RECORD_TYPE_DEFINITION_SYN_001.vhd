-- =============================================================
-- Case ID: TC_RECORD_TYPE_DEFINITION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_RECORD_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.6
-- Production: record_type_definition ::= record element_declaration { element_declaration } end record [ record_simple_name ]
-- Case Type: Positive
-- Test Focus: Record with multiple field types+nested record: t_packet(header bit_vector+payload bit_vector+crc bit_vector) / t_point(3 integer fields x,y,z) / t_nested(outer record containing an inner record field), verifying element_declaration supports multi-identifier lists(a,b:integer) and nested records
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rec_ent is port(y:out integer); end entity;
architecture bh of rec_ent is
  type t_packet is record
    header:bit_vector(7 downto 0); payload:bit_vector(31 downto 0); crc:bit_vector(7 downto 0);
  end record;
  type t_point is record x,y,z:integer; end record;
  type t_inner is record a:integer; b:bit; end record;
  type t_outer is record inner:t_inner; flag:boolean; end record;
  signal s_pkt:t_packet:=(header=>X"AA",payload=>(others=>'0'),crc=>X"00");
  signal s_pt:t_point:=(x=>1,y=>2,z=>3);
  signal s_out:t_outer:=(inner=>(a=>10,b=>'1'),flag=>true);
begin
  y<=s_pt.x+s_pt.y+s_pt.z+s_out.inner.a;
end architecture bh;
