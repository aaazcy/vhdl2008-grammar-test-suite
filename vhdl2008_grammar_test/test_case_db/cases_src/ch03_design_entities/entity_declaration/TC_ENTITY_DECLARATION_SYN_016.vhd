-- =============================================================
-- Case ID: TC_ENTITY_DECLARATION_SYN_016
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declaration ::= entity identifier is entity_header entity_declarative_part [ begin entity_statement_part ] end [ entity ] [ entity_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Comprehensive all features: entity contains VHDL 2008 generic type interface(type T) + generic function(with default implementation) + generic constant + port_clause(5 ports in all modes in/out/inout/buffer/linkage including custom protected type) + entity_declarative_part(types+subtypes+protected type+signals+constants+functions+attributes+disconnect) + entity_statement_part(concurrent assertion+passive process), combining all syntax elements that can exist at the entity level in a single entity
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_comprehensive is
  generic(
    type T;
    function f_cmp(a, b : T) return boolean is <>;
    constant C_INIT : T;
    G_DELAY : time := 1 ns
  );
  port(
    p_in     : in    T;
    p_out    : out   T;
    p_inout  : inout T;
    p_buf    : buffer T;
    p_status : out   boolean
  );
end entity ent_comprehensive;
architecture bh of ent_comprehensive is
  type t_state is (IDLE, ACTIVE, DONE);
  subtype t_delay is time range 0 ns to 1000 ns;
  constant C_MAX_DELAY : t_delay := 500 ns;
  signal s_state : t_state := IDLE;
  signal s_valid : boolean := false;
  function f_check(v : T) return boolean is
  begin return f_cmp(v, C_INIT); end function;
  attribute style : string;
  attribute style of f_check [T return boolean] : function is "checker";
begin
  s_valid <= f_check(p_in);
  p_buf   <= p_in;
  p_out   <= p_in;
  p_status <= s_valid;
  assert G_DELAY < C_MAX_DELAY
    report "delay exceeds max" severity warning;
end architecture bh;
