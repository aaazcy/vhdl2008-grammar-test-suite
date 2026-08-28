-- =============================================================
-- Case ID: TC_ENTITY_HEADER_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_header ::= [ formal_generic_clause ] [ formal_port_clause ]
-- Case Type: Positive
-- Test Focus: entity_header with generic subprogram defaults plus type generics—`generic(type data_t; function "+"(a,b:data_t) return data_t is <>; procedure log(msg:string) is <>; constant zero:data_t)` with port using the generic type `data_t` in all four modes (in/out/inout/buffer), exercising the entity_header production where the generic clause declares a VHDL 2008 type, two subprogram defaults, and a constant, and the port clause references the generic type across varied port directions
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity eh_gen_subprog is
  generic(
    type data_t;
    function "+"(a, b : data_t) return data_t is <>;
    procedure log(msg : string) is <>;
    constant zero : data_t
  );
  port(
    p_in    : in     data_t;
    p_out   : out    data_t;
    p_io    : inout  data_t;
    p_buf   : buffer data_t
  );
end entity eh_gen_subprog;

architecture bh of eh_gen_subprog is
begin
  p_out  <= p_in + p_buf;
  p_buf  <= p_io + zero;
  p_io   <= zero;
  log("entity_header with generic subprogram defaults compiled OK");
end architecture bh;
